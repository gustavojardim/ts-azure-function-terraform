import { AzureFunction, Context } from '@azure/functions'

const httpTrigger: AzureFunction = async (context: Context): Promise<void> => {
    context.log('HTTP trigger function processed a request.')

    const name = (req.query.name || (req.body && req.body.name))

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: `Bye ${name}! I hope you enjoyed this documentation`,
    }
}

export default httpTrigger
