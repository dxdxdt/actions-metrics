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
Updated: 2026-06-12T02:46:36.875943+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.779 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.788 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.471 |  |
| eu-west-1 | 0.354 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.588 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.082 | 4744 |
| us-east-2 | 0.075 | 1632 |
| us-gov-east-1 | 0.081 | 1711 |
| us-gov-west-1 | 0.271 | 198 |
| us-west-1 | 0.211 | 3658 |
| us-west-2 | 0.271 | 162 |

