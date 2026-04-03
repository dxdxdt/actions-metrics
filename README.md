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
Updated: 2026-04-03T21:26:22.652081+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.733 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.749 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.133 | 4426 |
| us-east-2 | 0.139 | 1477 |
| us-gov-east-1 | 0.141 | 1624 |
| us-gov-west-1 | 0.228 | 191 |
| us-west-1 | 0.167 | 3349 |
| us-west-2 | 0.228 | 153 |

