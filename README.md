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
Updated: 2026-07-06T00:00:01.735512+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.769 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.868 |  |
| ap-southeast-6 | 0.775 |  |
| ap-southeast-7 | 0.951 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.470 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.638 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.260 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.105 | 4827 |
| us-east-2 | 0.136 | 1652 |
| us-gov-east-1 | 0.135 | 1729 |
| us-gov-west-1 | 0.253 | 201 |
| us-west-1 | 0.216 | 3747 |
| us-west-2 | 0.254 | 164 |

