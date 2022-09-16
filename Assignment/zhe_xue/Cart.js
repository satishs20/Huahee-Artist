
    function CalculateTotal()
    {
             var gv = document.getElementById("<%= GridView1.ClientID%>");
    var tb = gv.getElementsByTagName("input");
    var lb = gv.getElementsByTagName("span");
    var sub=0;
    var total=0;

    var indexp = 0;
    var indexq = 1;
    var price = 0;
    var qty = 0;
    var totalqty = 0;
    var tbcount = tb.length / 2;
    for (var i = 0; i < tbcount; i++)
    {
                 if(tb[i].type="text")
    {
        sub = parseFloat(tb[i + indexp].value) * parseFloat(tb[i + indexq].value);
    if(isNaN(sub))
    {
        lb[i].innerHTML = "0.0";
    sub = 0;
                     }
    else
    {
        lb[i].innerHTML = sub;
                     }
    if(isNaN(tb[i+indexp].value) || tb[i+indexq].value=="")
    {
        qty = 0;
                     }
    else
    {
        qty = tb[i + indexq].value;

                     }
    totalqty=totalqty+parseInt(qty);
    total=total+parseFloat(sub);
                 }
    indexp++;
    indexq++;

             }
    lb[tbcount].innerHTML = "Total Quantity "+totalqty;
    lb[tbcount+1].innerHTML = "Grand Total "+total;


         }
