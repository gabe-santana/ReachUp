module.exports = async (req, res) => {
    try{
      //pegar a planta a partir do MapMaker
    }
    catch (err) {
      res.status(500).json({error: {code: '500', message: err.message}, payload: null});
    }

};