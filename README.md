# gms_cloud

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Rest Api Server

**Base Url**

```sh
https://app2.gmscloud.id
```

## Login

**Request**

```sh
POST /login
Content-Type: application/json
{
	"username" : "admin",
	"password": "123"
}
```

**Response**

```sh
{
    "status": true,
    "data": {
        "id": "fd3a18638006d2dccad6d0ede48927518f22860e20210613224255",
        "perusahaan": "TEST"
    }
}
```

```SH
{
    "status": false
}
```

## List Surat Jalan

```sh
POST /surat_jalan
Content-Type: application/json
{
	"id":"fd3a18638006d2dccad6d0ede48927518f22860e20210613224255",
	"perusahaan":"TEST"
}
```

**Response**

```sh
{
    "status": true,
    "data": [
        {
            "SURAT_JALAN_ID": "9f2e7c0ff2a395ee3fd0635c589f5ef837bd8c4320210818131922",
            "SURAT_JALAN_NOMOR": "0002/SJ/TEST/08-21",
            "SURAT_JALAN_TANGGAL": "2021-08-18",
            "ENTRI_WAKTU": "2021-08-18 13:19:37",
            "MASTER_RELASI_ID": "193fd6f740a66df37105f9726eaa3fc4b7370562202106060926",
	    "MASTER_SUPPLIER_ID": null,
            "SURAT_JALAN_JENIS": "penjualan",
            "TANGGAL": "18 Agustus 2021",
            "JAM": "13:19",
            "JENIS": "PENJUALAN",
            "NAMA": "KBK"
        }
    ]
}
```

## Detail Surat Jalan

```sh
GET /surat_jalan/detail/id/[SURAT_JALAN_ID]
Content-Type: application/json
```

**Response**

```sh
{
    "status": true,
    "data": [
        {
            "SURAT_JALAN_ID": "c3a692957e8cf068fdeb1d5459d32a5a0574f2b32021120793205",
            "SURAT_JALAN_NOMOR": "0001/SJ/TEST/12-21",
            "SURAT_JALAN_TANGGAL": "2021-12-07",
            "ENTRI_WAKTU": "2021-12-07 09:32:26",
            "MASTER_RELASI_ID": "8cefc62e0c6fb98ef94c67715991abd17fb71afe202106060926",
	    "MASTER_SUPPLIER_ID": null,
            "TANGGAL": "07 Desember 2021",
            "JAM": "9:32",
            "NAMA": "KBK",
            "BARANG": [
                {
                    "MASTER_BARANG_NAMA": "Oxygen 6 m3",
                    "SURAT_JALAN_BARANG_QUANTITY": "2",
                    "SURAT_JALAN_BARANG_QUANTITY_KOSONG": "0"
                }
            ]
        }
    ]
}
```

## Detail TTBK

```sh
GET /ttbk/detail/id/[SURAT_JALAN_ID]
Content-Type: application/json
```

**Response**

```sh
{
    "status": true,
    "mp": [
        {
            "MASTER_BARANG_NAMA": "Oxygen 6 m3"
        },
        {
            "MASTER_BARANG_NAMA": "Oxygen 6 m3"
        }
    ],
    "mr": [
        {
            "MASTER_BARANG_NAMA": "Oxygen 6 m3"
        }
    ]
}
```

## List Jenis Barang

```sh
POST /barang
Content-Type: application/json
{
    "perusahaan":"TEST"
}
```

**Response**

```sh
{
    "status": true,
    "data": [
        {
            "MASTER_BARANG_ID": "33c6cb7ea768ed07d04aa4206f24bb237600a1c0202104170332",
            "MASTER_BARANG_NAMA": "Oxygen 6 m3"
        },
        {
            "MASTER_BARANG_ID": "0597e06b6e5b76f42a85b477493c60c7701eed80202104170332",
            "MASTER_BARANG_NAMA": "Oxygen 1 m3"
        },
        {
            "MASTER_BARANG_ID": "45885a723595ab6b496b520df09dbfc33578dc41202106040338",
            "MASTER_BARANG_NAMA": "Oxygen 3 M3"
        },
        {
            "MASTER_BARANG_ID": "12f8e312a2ee2c531f45d86883043ac294f38d0f202104170333",
            "MASTER_BARANG_NAMA": "Oxygen 6 m3 UHP"
        },
        {
            "MASTER_BARANG_ID": "e24984f37f4c7252f30e05d734ca2a0b278f39ca202104170333",
            "MASTER_BARANG_NAMA": "N2 "
        },
        {
            "MASTER_BARANG_ID": "5a4fa232c3a04d0f19b79f149295c09aa2945216202104170333",
            "MASTER_BARANG_NAMA": "N2 HP"
        },
        {
            "MASTER_BARANG_ID": "f8e83f0671c7c84efc57e5497bd0953cef26a318202104170335",
            "MASTER_BARANG_NAMA": "C2H2 UHP"
        },
        {
            "MASTER_BARANG_ID": "b1b418c923b19485dee472c77a11e9857b233b16202104170335",
            "MASTER_BARANG_NAMA": "Helium"
        },
        {
            "MASTER_BARANG_ID": "c37060706aa9e83f8a127a5848b7627c9dc0f5bf202104170336",
            "MASTER_BARANG_NAMA": "H2"
        },
        {
            "MASTER_BARANG_ID": "24e4e0da0d3c1b2ee635279b4c2b282d525ed763202104230705",
            "MASTER_BARANG_NAMA": "LPG 50 KG"
        },
        {
            "MASTER_BARANG_ID": "792f537d9ee47b3fa4e67ef4fb1762c08c66b1eb202104230725",
            "MASTER_BARANG_NAMA": "UDT MINI"
        },
        {
            "MASTER_BARANG_ID": "7de9e5ac8c8c5fa192aa47e38b4653077741b0df202104230725",
            "MASTER_BARANG_NAMA": "UDT 6 M3"
        },
        {
            "MASTER_BARANG_ID": "6a455a2f525b06f8ac2d36ebff7f223597a456a5202104230820",
            "MASTER_BARANG_NAMA": "N2O"
        },
        {
            "MASTER_BARANG_ID": "bdb3ac22465bea01a18c62c3aa349fb5652cff39202105060348",
            "MASTER_BARANG_NAMA": "LPG 12 KG"
        },
        {
            "MASTER_BARANG_ID": "5b69ea6e34b564ca54eef0ff6867b9e311af9f0f202105311122",
            "MASTER_BARANG_NAMA": "LIQUID O2"
        },
        {
            "MASTER_BARANG_ID": "7eb9d04edfce3b5ed674655b5c8eac9372608da4202105311242",
            "MASTER_BARANG_NAMA": "CO2 18 KG"
        },
        {
            "MASTER_BARANG_ID": "779aa25c576ac9966a2fdeb1222d4ed788d5ba2a202105311241",
            "MASTER_BARANG_NAMA": "CO2 25 KG"
        },
        {
            "MASTER_BARANG_ID": "4bd652c015a72499c7f21fc7081cd3baaddc0f3c202104230724",
            "MASTER_BARANG_NAMA": "Air Sintetik"
        },
        {
            "MASTER_BARANG_ID": "b56cbf59e06bf3a676a8443c93a1e40148f35c9b202104170334",
            "MASTER_BARANG_NAMA": "Argon UHP"
        },
        {
            "MASTER_BARANG_ID": "94f18c7c47b645fce03fe4a1462ad9083287a2f3202104170335",
            "MASTER_BARANG_NAMA": "C2H2"
        },
        {
            "MASTER_BARANG_ID": "736c37d584b2747f58d128455a5d751bf384262c202106051256",
            "MASTER_BARANG_NAMA": "Valve O2"
        },
        {
            "MASTER_BARANG_ID": "a3894ae921df9771cf959fc25124434beb6cd34f202104170334",
            "MASTER_BARANG_NAMA": "Argon 6 m3"
        },
        {
            "MASTER_BARANG_ID": "16f9c87b1402bc5ecd5d8c846c832f183295f46f202104170334",
            "MASTER_BARANG_NAMA": "Argon HP"
        },
        {
            "MASTER_BARANG_ID": "012036f8d08954350c8d4306786726f3ef52feb1202104170335",
            "MASTER_BARANG_NAMA": "C2H2 HP"
        },
        {
            "MASTER_BARANG_ID": "4e52bc9ed58d3ac82eb23447b21c39da77e01de2202104170334",
            "MASTER_BARANG_NAMA": "CO2"
        },
        {
            "MASTER_BARANG_ID": "6e8c3855a25e9017b8f0973f9f3b7264497d3a52202104230706",
            "MASTER_BARANG_NAMA": "LPG  18 KG"
        },
        {
            "MASTER_BARANG_ID": "2dfa01d0fdc38369da9834aba1f962187945d24e202104170332",
            "MASTER_BARANG_NAMA": "Oxygen 6 m3 HP"
        }
    ]
}
```

## Simpan TTBK

```sh
POST /ttbk
```

```sh
id_surat_jalan : [SURAT_JALAN_ID]
file : [file_path]
ttbk[0] : [id_jenis_barang],[MP],[MR]
ttbk[1] : [id_jenis_barang],[MP],[MR]
ttbk[2] : [id_jenis_barang],[MP],[MR]

ttbk:
[
	{
		"id_barang" : "000000",
		"mp" : 2,
		"mr" : 3,
		"isi_kosong" : "isi"
	},
	{
		"id_barang" : "000000",
		"mp" : 2,
		"mr" : 3,
		"isi_kosong" : "isi"
	}
]
```

**Response**

```sh
{
    "status": true,
    "id_surat_jalan": "12121212",
    "file": "https://app2.gmscloud.id/uploads/522e4ee7da7de4b003d72bde051bbad3d5326780.jpeg",
    "ttbk": [
        "id_jenis_barang,2,3",
        "id_jenis_barang,5,6"
    ]
}
```
