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
Updated: 2026-03-17T18:52:01.988660+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.620 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.801 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.767 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.225 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.542 |  |
| eu-central-2 | 0.569 |  |
| eu-north-1 | 0.603 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.916 |  |
| me-south-1 | 0.874 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.191 | 4297 |
| us-east-2 | 0.181 | 1430 |
| us-gov-east-1 | 0.175 | 1584 |
| us-gov-west-1 | 0.157 | 187 |
| us-west-1 | 0.128 | 3247 |
| us-west-2 | 0.155 | 148 |

