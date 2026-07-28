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
Updated: 2026-07-28T23:53:36.102558+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.598 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.623 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.670 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.275 | 17 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.535 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.499 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.212 | 4917 |
| us-east-2 | 0.203 | 1670 |
| us-gov-east-1 | 0.207 | 1782 |
| us-gov-west-1 | 0.156 | 207 |
| us-west-1 | 0.100 | 3851 |
| us-west-2 | 0.158 | 171 |

