require 'rails_helper'

feature 'User issues delivery receipt' do
  scenario 'successfully' do
    category = create(:category)

    equipment = create(:equipment)

    customer = create(:customer)

    contract = create(:contract, amount: 500, total_amount: 500)


    contract.equipment << equipment

    visit contracts_path

    click_on contract.delivery_address

    click_on "Emitir Recibo de Entrega"

    expect(page).to have_content "São Paulo, #{contract.delivery_receipt.issue_date.strftime("%d de %B de %Y")}
    Eu, #{contract.contact}
    em nome da empresa #{contract.customer.legal_name}. (razão social), inscrita no CNPJ x
    declaro ter recebido os equipamentos #{equipment.name}
    pelo período de #{contract.rental_period} em perfeitas condições de uso
    no endereço #{contract.delivery_address}.
    de acordo com o contrato #{contract.id}
    emitido no dia #{contract.created_at.strftime("%d /%m/%Y")}.
    ...............................
    (Assinatura do Responsável)"


  end
end
