set client_encoding='WIN1252';
select 
	pv.idcliente as idcliente, c.nome as cliente, p.nome as produto, fo.nome as fornecedor, fo.idpessoa as idfornecedor, pv.dtstatusvenda,ipv.statusitem,pv.idvendedor, ipv.idproduto, ipv.peso as pesounitario, ipv.qtdentregue as qtdnofator, ipv.qtdestqanterior as estoque_anterior,(ipv.peso * ipv.qtdfator) as pesototal, pv.idcliente, ci.nome as cidade, ci.uf, (ipv.qtdentregue * qtdnaunidade) as qtdvendido, 
	(ipv.totalvendido / ipv.qtdfator) as vlrunitario, ipv.totalvendido as vlrtotal from 

	item_pedido_venda ipv join produto p on ipv.idproduto = p.idproduto 
	join pedido_venda pv on ipv.idpedidovenda = pv.idpedidovenda 
	join pessoa c on pv.idcliente = c.idpessoa
	join pessoa fo on p.idfabricante = fo.idpessoa
	join cidade ci on c.idcidade = ci.idcidade
	join financeiro f on pv.idpedidovenda = f.idvenda
where pv.dtstatusvenda >= '2016-01-01' and fo.nome like '%MONTE LIBA%' 
order by ipv.idpedidovenda desc