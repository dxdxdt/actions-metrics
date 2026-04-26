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
Updated: 2026-04-26T05:12:20.521727+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.675 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.880 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.823 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.100 | 4565 |
| us-east-2 | 0.099 | 1533 |
| us-gov-east-1 | 0.093 | 1664 |
| us-gov-west-1 | 0.256 | 194 |
| us-west-1 | 0.195 | 3481 |
| us-west-2 | 0.249 | 157 |

