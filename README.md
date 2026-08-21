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
Updated: 2026-08-21T10:21:55.939180+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.602 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.763 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.168 | 18 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.471 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.410 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.109 | 5036 |
| us-east-2 | 0.138 | 1680 |
| us-gov-east-1 | 0.147 | 1865 |
| us-gov-west-1 | 0.265 | 224 |
| us-west-1 | 0.198 | 4010 |
| us-west-2 | 0.256 | 184 |

