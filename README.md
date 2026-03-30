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
Updated: 2026-03-30T17:46:15.560889+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.888 |  |
| ap-east-1 | 0.793 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.861 |  |
| ap-southeast-5 | 0.898 |  |
| ap-southeast-6 | 0.828 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.294 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.424 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.379 |  |
| il-central-1 | 0.581 |  |
| me-central-1 | 0.767 |  |
| me-south-1 | 0.725 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.067 | 4400 |
| us-east-2 | 0.084 | 1467 |
| us-gov-east-1 | 0.102 | 1615 |
| us-gov-west-1 | 0.304 | 190 |
| us-west-1 | 0.264 | 3321 |
| us-west-2 | 0.314 | 152 |

