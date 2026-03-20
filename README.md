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
Updated: 2026-03-20T18:37:15.871657+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.723 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.870 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.380 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.752 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.079 | 4317 |
| us-east-2 | 0.081 | 1441 |
| us-gov-east-1 | 0.079 | 1591 |
| us-gov-west-1 | 0.278 | 189 |
| us-west-1 | 0.267 | 3267 |
| us-west-2 | 0.273 | 148 |

