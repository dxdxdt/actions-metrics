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
Updated: 2026-03-24T21:31:00.652668+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.737 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.840 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.876 |  |
| ap-southeast-2 | 0.795 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.824 |  |
| ap-southeast-7 | 0.985 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.328 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.770 |  |
| me-south-1 | 0.732 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.496 |  |
| us-east-1 | 0.068 | 4354 |
| us-east-2 | 0.100 | 1449 |
| us-gov-east-1 | 0.096 | 1601 |
| us-gov-west-1 | 0.303 | 190 |
| us-west-1 | 0.244 | 3291 |
| us-west-2 | 0.303 | 151 |

