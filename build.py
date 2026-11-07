"""Bangun web/data.json dan supabase/seed.sql dari CSV di folder data/.

Jalankan: python3 build.py
"""
import csv, json, pathlib

ROOT = pathlib.Path(__file__).parent
D = ROOT / "data"


def baca(nama):
    with open(D / nama, newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def angka(v):
    if v is None or v == "":
        return None
    try:
        x = float(v)
        return int(x) if x.is_integer() and "." not in str(v) else x
    except ValueError:
        return {"True": True, "False": False}.get(v, v)


def bersih(rows):
    return [{k: angka(v) for k, v in r.items()} for r in rows]


TABEL = {
    "provinsi": "bps_ecommerce_provinsi_2024.csv",
    "indikator_nasional": "bps_ecommerce_nasional_2024.csv",
    "tarif": "tarif_paket_vs_kargo_2026.csv",
    "wbes": "wbes_indonesia_2023.csv",
    "sumber": "sumber.csv",
}

data = {k: bersih(baca(v)) for k, v in TABEL.items()}
for r in data["provinsi"]:
    r["prioritas"] = bool(r["prioritas"])
(ROOT / "web" / "data.json").write_text(json.dumps(data, ensure_ascii=False), encoding="utf-8")


def tipe(vals):
    vs = [v for v in vals if v is not None]
    if vs and all(isinstance(v, bool) for v in vs):
        return "boolean"
    if vs and all(isinstance(v, int) and not isinstance(v, bool) for v in vs):
        return "bigint"
    if vs and all(isinstance(v, (int, float)) and not isinstance(v, bool) for v in vs):
        return "numeric"
    return "text"


def lit(v):
    if v is None:
        return "null"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return repr(v)
    return "'" + str(v).replace("'", "''") + "'"


sql = ["-- Dibangkitkan otomatis oleh build.py. Jalankan di SQL Editor Supabase (akun pribadi).",
       "create schema if not exists fpda;", ""]
for t, rows in data.items():
    cols = list(rows[0].keys())
    defs = ",\n  ".join(f'"{c}" {tipe([r[c] for r in rows])}' for c in cols)
    sql += [f"drop table if exists fpda.{t};",
            f"create table fpda.{t} (\n  id_baris bigint generated always as identity primary key,\n  {defs}\n);",
            f"alter table fpda.{t} enable row level security;",
            f"create policy \"baca publik {t}\" on fpda.{t} for select to anon, authenticated using (true);",
            f"grant usage on schema fpda to anon, authenticated;",
            f"grant select on fpda.{t} to anon, authenticated;"]
    vals = ",\n".join("(" + ", ".join(lit(r[c]) for c in cols) + ")" for r in rows)
    sql += [f"insert into fpda.{t} ({', '.join(chr(34)+c+chr(34) for c in cols)}) values\n{vals};", ""]
sql.append("-- Setelah dijalankan: Settings > API > Exposed schemas, tambahkan 'fpda'.")
(ROOT / "supabase" / "seed.sql").write_text("\n".join(sql), encoding="utf-8")
print({k: len(v) for k, v in data.items()})
