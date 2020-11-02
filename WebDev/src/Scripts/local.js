import { LocalController } from '../Controllers/LocalController';

$(() => {

    $("#pesquisarLocal").change(async () => {
       const search = this.val();

       const clsLocal = new LocalController.clsLocalController();
       const response = await clsLocal.GetByBeacon(search);
       
       const table = $("#localTable");
       const content = document.createElement('tbody');
       const row = document.createElement('tr');
       const cow = document.createElement('td');

       table.append(content);

       response.forEach(local => {
        const row = document.createElement('tr');
        content.append(row);
        local.forEach(data => {
           
        })
      })
    })
})