SELECT(
  CONCAT(id_invoice, '_', id_barang) id_penjualan,
  pjl.id_invoice,
  pjl.tanggal,
  pjl.id_barang,
  pjl.nama_barang,
  pjl.harga,
  pjl.unit,
  pjl.jumlah_barang,
  (jumlah_barang * pjl.harga) AS total_harga_per_barang,
  pjl.mata_uang,
  brg.kode_brand,
  brg.brand,
  pjl.id_customer,
  pjl.nama nama_customer,
  plg.cabang_sales,
  plg.id_distributor,
  plg.group AS group_category
FROM 'composite-silo-130101.rakamin.penjualan' pjl
LEFT JOIN 'composite-silo-130101.rakamin.barang' brg
ON (pjl.id_barang = brg.kode_barang)
LEFT JOIN 'composite-silo-130101.rakamin.pelanggan' plg
ON (pjl.id_customer = plg.id_customer)
);
