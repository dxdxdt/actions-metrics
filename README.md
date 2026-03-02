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
Updated: 2026-03-02T22:21:03.599902+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.914 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.591 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.920 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.851 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.422 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.797 |  |
| me-south-1 | 0.757 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.083 | 4211 |
| us-east-2 | 0.104 | 1391 |
| us-gov-east-1 | 0.094 | 1523 |
| us-gov-west-1 | 0.275 | 168 |
| us-west-1 | 0.249 | 3161 |
| us-west-2 | 0.282 | 136 |

