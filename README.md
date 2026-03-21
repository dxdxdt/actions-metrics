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
Updated: 2026-03-21T08:23:38.280596+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.990 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.147 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.121 | 4319 |
| us-east-2 | 0.099 | 1445 |
| us-gov-east-1 | 0.110 | 1591 |
| us-gov-west-1 | 0.207 | 189 |
| us-west-1 | 0.189 | 3271 |
| us-west-2 | 0.209 | 149 |

