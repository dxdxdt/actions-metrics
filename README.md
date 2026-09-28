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
Updated: 2026-09-28T00:11:02.461087+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.916 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.946 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.910 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.998 |  |
| ca-central-1 | 0.110 | 18 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.422 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.388 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.768 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.065 | 5126 |
| us-east-2 | 0.083 | 1687 |
| us-gov-east-1 | 0.099 | 1930 |
| us-gov-west-1 | 0.288 | 236 |
| us-west-1 | 0.238 | 4142 |
| us-west-2 | 0.288 | 192 |

