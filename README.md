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
Updated: 2026-07-10T20:16:33.987817+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.971 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.554 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.848 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.201 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.507 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.159 | 4845 |
| us-east-2 | 0.176 | 1656 |
| us-gov-east-1 | 0.149 | 1734 |
| us-gov-west-1 | 0.221 | 202 |
| us-west-1 | 0.164 | 3762 |
| us-west-2 | 0.221 | 164 |

