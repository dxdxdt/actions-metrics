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
Updated: 2026-03-31T04:31:12.767781+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.711 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.663 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.809 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.135 | 4404 |
| us-east-2 | 0.116 | 1467 |
| us-gov-east-1 | 0.118 | 1616 |
| us-gov-west-1 | 0.228 | 190 |
| us-west-1 | 0.174 | 3324 |
| us-west-2 | 0.226 | 152 |

