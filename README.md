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
Updated: 2026-05-05T05:36:11.949530+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.810 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.747 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.818 |  |
| ap-southeast-3 | 0.952 |  |
| ap-southeast-4 | 0.851 |  |
| ap-southeast-5 | 0.919 |  |
| ap-southeast-6 | 0.871 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.409 |  |
| eu-north-1 | 0.431 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.419 |  |
| eu-west-1 | 0.304 |  |
| eu-west-2 | 0.338 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.542 |  |
| me-central-1 | 0.758 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.476 |  |
| us-east-1 | 0.055 | 4597 |
| us-east-2 | 0.097 | 1566 |
| us-gov-east-1 | 0.100 | 1673 |
| us-gov-west-1 | 0.351 | 194 |
| us-west-1 | 0.291 | 3532 |
| us-west-2 | 0.358 | 157 |

