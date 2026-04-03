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
Updated: 2026-04-03T09:46:25.638273+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.043 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.666 |  |
| ap-southeast-7 | 0.841 |  |
| ca-central-1 | 0.261 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.587 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.595 |  |
| eu-west-1 | 0.478 |  |
| eu-west-2 | 0.524 |  |
| eu-west-3 | 0.544 |  |
| il-central-1 | 0.755 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.667 |  |
| us-east-1 | 0.212 | 4423 |
| us-east-2 | 0.186 | 1475 |
| us-gov-east-1 | 0.188 | 1622 |
| us-gov-west-1 | 0.144 | 191 |
| us-west-1 | 0.089 | 3344 |
| us-west-2 | 0.146 | 153 |

