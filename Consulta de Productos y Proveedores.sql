SELECT Prod_Id, Prod_Descripcion, Prod_ProvId, Prov_Nombre
FROM productos
JOIN proveedores ON Prod_ProvId = Prov_Id
