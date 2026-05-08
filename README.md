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
Updated: 2026-05-08T17:05:13.458570+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.747 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.670 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.878 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.620 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.570 |  |
| us-east-1 | 0.104 | 4612 |
| us-east-2 | 0.085 | 1575 |
| us-gov-east-1 | 0.081 | 1681 |
| us-gov-west-1 | 0.248 | 194 |
| us-west-1 | 0.198 | 3540 |
| us-west-2 | 0.245 | 157 |

