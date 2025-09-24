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
Updated: 2025-09-24T11:10:53.593593+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.972 |  |
| ap-east-1 | 0.722 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.629 |  |
| ap-south-1 | 0.952 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.691 |  |
| ca-central-1 | 0.181 | 15 |
| eu-central-1 | 0.487 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.512 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.466 |  |
| me-south-1 | 0.794 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.168 | 3149 |
| us-east-2 | 0.167 | 804 |
| us-gov-east-1 | 0.132 | 1008 |
| us-gov-west-1 | 0.189 | 35 |
| us-west-1 | 0.171 | 2093 |
| us-west-2 | 0.195 | 15 |

