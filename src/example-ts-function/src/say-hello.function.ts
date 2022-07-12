import { AzureFunction, Context } from '@azure/functions'

const httpTrigger: AzureFunction = async (context: Context): Promise<void> => {
    context.log('HTTP trigger function processed a request.')

    const name = (req.query.name || (req.body && req.body.name))

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: `Hello ${name}! I hope this tutorial can help you. `,
    }
}

export default httpTrigger
