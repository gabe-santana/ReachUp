import { LocalController } from '../Controllers/LocalController.ts';

$(() => {

  document.cookie = `userToken=TOKEN_DJ`
  alert(document.cookie);
  //main();

  function main() { document.cookie = `userToken=TOKEN_DJ`;

  var cookies = document.cookie,
              prefix = 'userToken' + '=',
              begin = cookies.indexOf('; ' + prefix);

          if (begin == -1) {
            begin = cookies.indexOf(prefix);

            if (begin != 0) {
              return null;
            }
          } else {
             begin += 2;
          }

          var end = cookies.indexOf(';', begin);

          if (end == -1) {
            end = cookies.length;
          }
          console.log(cookies.substring(begin + prefix.length, end));
        }

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

    $("#adicionarLocal").click(() => {
      window.location.href = "../../public/adicionarLocal.html";
    })
})