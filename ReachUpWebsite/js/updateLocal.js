$(function(){

    import { clsLocalRepository } 
    from '../classes/repositories/LocalRepository.js';

    $('#btnUpdateLocal').click(function(){

        const name = $('#txtLocalName').val();
        const type = $('#localType').val();
        const floor = $('#localFloor').val();
        const beaconUUID = $('#txtLocalBeaconUUID').val();

        const local = [name, type, floor, beaconUUID];
        main(local);
    })

    async function main(local)
    {
        const LocalRepo = new clsLocalRepository();
        const isOK = await LocalRepo.patch(local);
        return isOK;
    }

})