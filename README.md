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
Updated: 2026-03-26T16:05:22.503126+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.960 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.654 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.751 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.173 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.476 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.688 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.430 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.805 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.138 | 4363 |
| us-east-2 | 0.119 | 1456 |
| us-gov-east-1 | 0.116 | 1606 |
| us-gov-west-1 | 0.221 | 190 |
| us-west-1 | 0.164 | 3302 |
| us-west-2 | 0.221 | 151 |

