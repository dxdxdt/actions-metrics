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
Updated: 2026-08-03T13:34:06.131573+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.554 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.578 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.910 |  |
| ca-central-1 | 0.162 | 17 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.396 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.622 |  |
| me-central-1 | 0.868 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.131 | 4936 |
| us-east-2 | 0.133 | 1673 |
| us-gov-east-1 | 0.118 | 1799 |
| us-gov-west-1 | 0.240 | 209 |
| us-west-1 | 0.172 | 3877 |
| us-west-2 | 0.235 | 172 |

