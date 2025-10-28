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
Updated: 2025-10-28T11:11:30.142468+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.804 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.720 |  |
| ap-south-1 | 0.848 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.781 |  |
| ca-central-1 | 0.116 | 15 |
| eu-central-1 | 0.414 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.425 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.387 |  |
| me-south-1 | 0.725 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.074 | 3373 |
| us-east-2 | 0.088 | 985 |
| us-gov-east-1 | 0.094 | 1121 |
| us-gov-west-1 | 0.281 | 65 |
| us-west-1 | 0.246 | 2312 |
| us-west-2 | 0.274 | 22 |

