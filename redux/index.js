const Redux = require('redux')
const { createStore, combineReducers } = Redux
//escrever uma função criadora de ação
//ela produz uma ação que representa a criaçao de um novo contrato
const criarContrato = (nome, taxa) => {
    return {
        type: "CRIAR_CONTRATO",
        payload: {
            nome: nome,
            taxa: taxa
        }
    }
}
//escrever uma nova criadora de ação
//ela serve para cancelar contratos, dado um nome
const cancelaContrato = (nome, multa) => {
    return {
        type: "CANCELAR_CONTRATO",
        payload: {
            nome,
            multa
        }
    }
}
//escrever a função para solicitar cashback
//ela também pe criadora de ação
const solicitaCashback = (nome, valor) => ({
    type: "SOLICITAR_CASHBACK",
    payload: {
        nome, valor
    }
})

const valChashback = (list = [], obj) => {
    return obj.type === "SOLICITAR_CASHBACK" ? [...list, obj.payload] : list
}

const caixa = (obj, valorEmCaixa = 0) => {
    return obj.type === "SOLICITAR_CASHBACK" 
    ? valorEmCaixa - obj.payload.valor
    : obj.type === "CRIAR_CONTRATO"
    ? valorEmCaixa - obj.payload.taxa
    : obj.type === "CANCELAR_CONTRATO"
    ? valorEmCaixa + obj.payload.multa
    : valorEmCaixa
}

const valContrato = (list = [], obj) => {
    return obj.type === "CRIAR_CONTRATO" 
    ? [...list, obj.payload] 
    : obj.type === "CANCELAR_CONTRATO"
    ? list.filter(contract => contract.nome !== obj.payload.nome)
    : list
}

const todosOsReducers = combineReducers({
    valChashback,
    caixa,
    valContrato
})

const store = createStore(todosOsReducers)

// - Cria um contrato para José
// - Cria um contrato para Maria
// - Solicita cashback de 10 para Maria
// - Solicita cashback de 20 para José
// - Cancela o contrato de Maria
// Após cada atividade exibir estado atual

store.subscribe(() => {
    console.log('Estado atual:', store.getState());
});
store.dispatch(criarContrato('José', 100));
store.dispatch(criarContrato('Maria', 200));
store.dispatch(solicitarCashback('José', 10));
store.dispatch(cancelarContrato('Maria'));
