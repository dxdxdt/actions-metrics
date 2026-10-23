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
Updated: 2026-10-23T00:17:17.684124+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.650 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.724 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.784 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.827 |  |
| ca-central-1 | 0.241 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.556 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.584 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.894 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.672 |  |
| us-east-1 | 0.207 | 5158 |
| us-east-2 | 0.172 | 1706 |
| us-gov-east-1 | 0.202 | 1951 |
| us-gov-west-1 | 0.140 | 240 |
| us-west-1 | 0.134 | 4185 |
| us-west-2 | 0.140 | 195 |

