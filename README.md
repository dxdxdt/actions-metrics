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
Updated: 2026-04-13T07:11:48.786402+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.549 |  |
| ap-northeast-2 | 0.656 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.543 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.393 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.577 |  |
| us-east-1 | 0.122 | 4491 |
| us-east-2 | 0.117 | 1498 |
| us-gov-east-1 | 0.114 | 1646 |
| us-gov-west-1 | 0.232 | 192 |
| us-west-1 | 0.179 | 3405 |
| us-west-2 | 0.235 | 155 |

