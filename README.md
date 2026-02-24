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
Updated: 2026-02-24T10:40:46.967154+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.144 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.486 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.658 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.110 | 4175 |
| us-east-2 | 0.102 | 1374 |
| us-gov-east-1 | 0.099 | 1504 |
| us-gov-west-1 | 0.228 | 161 |
| us-west-1 | 0.204 | 3111 |
| us-west-2 | 0.242 | 130 |

