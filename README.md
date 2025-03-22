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
Updated: 2025-03-22T12:20:12.486507+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.784 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.601 |  |
| ap-south-1 | 0.890 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.631 |  |
| ca-central-1 | 0.243 | 10 |
| eu-central-1 | 0.574 |  |
| eu-north-1 | 0.627 |  |
| eu-south-1 | 0.577 |  |
| eu-west-1 | 0.478 |  |
| eu-west-2 | 0.520 |  |
| eu-west-3 | 0.542 |  |
| me-south-1 | 0.911 |  |
| sa-east-1 | 0.650 |  |
| us-east-1 | 0.207 | 1349 |
| us-east-2 | 0.191 | 340 |
| us-gov-east-1 | 0.184 | 351 |
| us-gov-west-1 | 0.154 | 1 |
| us-west-1 | 0.118 | 907 |
| us-west-2 | 0.161 |  |

