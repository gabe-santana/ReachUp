$(function(){

    import { clsLocalRepository } 
    from '../classes/repositories/LocalRepository.js';

    $('#btnDeleteLocal').click(function(id){
        main(id);
    })

    async function main(id)
    {
        const LocalRepo = new clsLocalRepository();
        const isOK = await LocalRepo.patch(id);
        return isOK;
    }

})