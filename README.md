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
Updated: 2026-08-23T09:20:23.859906+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.662 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.586 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.892 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.263 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.556 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.505 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.697 |  |
| me-central-1 | 0.932 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.200 | 5048 |
| us-east-2 | 0.215 | 1681 |
| us-gov-east-1 | 0.188 | 1871 |
| us-gov-west-1 | 0.166 | 225 |
| us-west-1 | 0.102 | 4035 |
| us-west-2 | 0.167 | 184 |

