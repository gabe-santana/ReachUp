$( async () => {

    const clsLocal = new LocalController();

    getAll();

    async function getAll()
    {
        const stores = await clsLocal.getAll(0);

        const cmbStores = $("#cmbStores");

        stores.forEach(store => {
           const option = document.createElement('option');
           option.id = store.idLocal;
           option.value = store.idLocal;
           option.innerText = store.name;
           cmbStores.append(option);
        })
    }
})