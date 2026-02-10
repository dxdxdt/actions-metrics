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
Updated: 2026-02-10T21:36:16.875882+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.698 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.619 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.724 |  |
| ca-central-1 | 0.195 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.886 |  |
| me-south-1 | 0.849 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.168 | 4098 |
| us-east-2 | 0.135 | 1330 |
| us-gov-east-1 | 0.136 | 1449 |
| us-gov-west-1 | 0.177 | 143 |
| us-west-1 | 0.178 | 3037 |
| us-west-2 | 0.176 | 125 |

