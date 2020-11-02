import { LocalController } from '../Controllers/LocalController';

$(() => {

   await getAll($("#cmbLocalType").val());

   $("#cmbLocalType").change(async () => {
     const type = this.val();
     await getAll(type);
   })
   
    async function getAll(type)
    {
      const clsLocal = new LocalController.clsLocalController();
      const response = await clsLocal.GetAll(type);

      const table = $("#localTable");
      const content = document.createElement('tbody');

      table.append(content);

      response.forEach(local => {
       const row = document.createElement('tr');
       local.forEach(data => {
         const cow = document.createElement('td');
         cow.innerText = data[i].ToString();
         row.append(cow);
       })
       content.append(row);
     })
    }

    $("#pesquisarLocal").change(async () => {
       const search = this.val();

       const clsLocal = new LocalController.clsLocalController();
       const response = await clsLocal.GetByBeacon(search);
       
       const table = $("#localTable");
       const content = document.createElement('tbody');

       table.append(content);

       response.forEach(local => {
        const row = document.createElement('tr');
        local.forEach(data => {
          const cow = document.createElement('td');
          cow.innerText = data[i].ToString();
          row.append(cow);
        })
        content.append(row);
      })
    })
})