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
Updated: 2026-09-05T13:09:01.202118+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.549 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.972 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.159 | 18 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.425 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.193 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.127 | 5084 |
| us-east-2 | 0.119 | 1685 |
| us-gov-east-1 | 0.099 | 1897 |
| us-gov-west-1 | 0.229 | 231 |
| us-west-1 | 0.168 | 4082 |
| us-west-2 | 0.225 | 192 |

