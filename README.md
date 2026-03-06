# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-03-06T13:49:44.302867+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.608 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.878 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.458 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.383 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.291 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.097 | 4231 |
| us-east-2 | 0.123 | 1402 |
| us-gov-east-1 | 0.138 | 1532 |
| us-gov-west-1 | 0.275 | 173 |
| us-west-1 | 0.209 | 3184 |
| us-west-2 | 0.279 | 141 |

