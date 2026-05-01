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
Updated: 2026-05-01T23:44:20.366379+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.747 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.501 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.470 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.108 | 4582 |
| us-east-2 | 0.133 | 1554 |
| us-gov-east-1 | 0.126 | 1670 |
| us-gov-west-1 | 0.277 | 194 |
| us-west-1 | 0.223 | 3514 |
| us-west-2 | 0.276 | 157 |

