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
Updated: 2026-03-24T20:34:21.288785+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.920 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.851 |  |
| ap-southeast-2 | 0.773 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.957 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.480 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.464 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.752 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.094 | 4353 |
| us-east-2 | 0.104 | 1449 |
| us-gov-east-1 | 0.106 | 1601 |
| us-gov-west-1 | 0.279 | 190 |
| us-west-1 | 0.222 | 3291 |
| us-west-2 | 0.280 | 151 |

