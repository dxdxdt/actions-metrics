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
Updated: 2026-07-09T04:43:57.322051+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.861 |  |
| ap-east-1 | 0.826 |  |
| ap-east-2 | 0.765 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.750 |  |
| ap-northeast-3 | 0.680 |  |
| ap-south-1 | 0.812 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.895 |  |
| ap-southeast-2 | 0.793 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.843 |  |
| ap-southeast-5 | 0.917 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 1.003 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.376 |  |
| eu-central-2 | 0.398 |  |
| eu-north-1 | 0.422 |  |
| eu-south-1 | 0.405 |  |
| eu-south-2 | 0.408 |  |
| eu-west-1 | 0.295 |  |
| eu-west-2 | 0.332 |  |
| eu-west-3 | 0.356 |  |
| il-central-1 | 0.529 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.044 | 4838 |
| us-east-2 | 0.071 | 1656 |
| us-gov-east-1 | 0.087 | 1732 |
| us-gov-west-1 | 0.313 | 201 |
| us-west-1 | 0.271 | 3758 |
| us-west-2 | 0.322 | 164 |

