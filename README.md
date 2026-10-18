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
Updated: 2026-10-18T12:20:02.847757+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.928 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.171 | 18 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.511 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.143 | 5151 |
| us-east-2 | 0.147 | 1702 |
| us-gov-east-1 | 0.137 | 1948 |
| us-gov-west-1 | 0.199 | 239 |
| us-west-1 | 0.167 | 4175 |
| us-west-2 | 0.201 | 195 |

