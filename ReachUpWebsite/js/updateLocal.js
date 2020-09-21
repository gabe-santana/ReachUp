$(function(){

    import { clsLocalRepository } 
    from '../classes/repositories/LocalRepository.js';

    $('#btnUpdateLocal').click(function(){

        return;
    })

    async function main()
    {
        const LocalRepo = new clsLocalRepository();
        const isOK = await LocalRepo.patch();
        return isOK;
    }

})