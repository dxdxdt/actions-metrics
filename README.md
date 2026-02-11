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
Updated: 2026-02-11T09:44:30.661299+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.782 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.716 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.858 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.808 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.426 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.446 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.387 |  |
| il-central-1 | 0.569 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.761 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.081 | 4101 |
| us-east-2 | 0.116 | 1331 |
| us-gov-east-1 | 0.113 | 1451 |
| us-gov-west-1 | 0.319 | 143 |
| us-west-1 | 0.244 | 3039 |
| us-west-2 | 0.328 | 125 |

