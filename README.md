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
Updated: 2026-07-09T00:02:43.478432+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.864 |  |
| ap-east-1 | 0.822 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.746 |  |
| ap-northeast-3 | 0.673 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.896 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.949 |  |
| ap-southeast-4 | 0.821 |  |
| ap-southeast-5 | 0.921 |  |
| ap-southeast-6 | 0.815 |  |
| ap-southeast-7 | 1.006 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.319 |  |
| eu-central-1 | 0.388 |  |
| eu-central-2 | 0.406 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.345 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.546 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.055 | 4837 |
| us-east-2 | 0.076 | 1656 |
| us-gov-east-1 | 0.094 | 1732 |
| us-gov-west-1 | 0.305 | 201 |
| us-west-1 | 0.255 | 3758 |
| us-west-2 | 0.305 | 164 |

